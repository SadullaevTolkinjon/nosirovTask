import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HardwareBarcodeScanner extends StatefulWidget {
  final Function(String barcode) onBarcodeScanned;
  final Duration debounceDuration;
  final bool allowDuplicateScans;
  final String visibilityKey;
  final bool enabled;
  final Function(bool isScanning)? onScanningStateChanged;
  final Widget child;
  final bool debugMode;

  const HardwareBarcodeScanner({
    super.key,
    required this.onBarcodeScanned,
    required this.child,
    required this.visibilityKey,
    this.debounceDuration = const Duration(milliseconds: 200),
    this.allowDuplicateScans = false,
    this.enabled = true,
    this.onScanningStateChanged,
    this.debugMode = false,
  });

  @override
  State<HardwareBarcodeScanner> createState() => _HardwareBarcodeScannerState();
}

class _HardwareBarcodeScannerState extends State<HardwareBarcodeScanner> {
  bool _isProcessing = false;
  Timer? _debounceTimer;
  String? _lastScannedBarcode;
  DateTime? _lastScanTime;
  
  // ✅ Add method channel - this is what was missing!
  static const platform = MethodChannel('barcode_scanner');
  late String _instanceId;

  @override
  void initState() {
    super.initState();
    
    _instanceId = 'Hardware_${widget.visibilityKey}_${DateTime.now().millisecondsSinceEpoch}';
    
    if (widget.debugMode) {
      print('🚀 HardwareBarcodeScanner initState: $_instanceId');
    }
    
    // ✅ Set up method channel - this connects to RT40S
    _setupMethodChannel();
    _updateScannerState();
    
    // Force focus on Android side
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && widget.enabled) {
        _forceRefocus();
      }
    });
  }

  void _setupMethodChannel() {
    if (widget.debugMode) {
      print('📡 $_instanceId: Setting up method channel for RT40S');
    }
    
    // ✅ This is the missing piece - direct connection to Android
    platform.setMethodCallHandler((call) async {
      if (widget.debugMode) {
        print('📡 $_instanceId: Method call received: ${call.method}');
      }
      
      if (!mounted) {
        if (widget.debugMode) {
          print('🚫 $_instanceId: Not mounted, ignoring');
        }
        return;
      }
      
      switch (call.method) {
        case 'onBarcodeScanned':
          final barcode = call.arguments as String;
          
          if (widget.debugMode) {
            print('🎯 $_instanceId: RT40S barcode received: $barcode');
          }
          
          _handleBarcodeScanned(barcode);
          break;
      }
    });
  }

  void _updateScannerState() {
    if (!mounted) return;
    
    try {
      platform.invokeMethod('enableScanner', {'enabled': widget.enabled});
      platform.invokeMethod('setDebugMode', {'debug': widget.debugMode});
      
      if (widget.debugMode) {
        print('⚙️ $_instanceId: Scanner state updated (enabled: ${widget.enabled})');
      }
    } catch (e) {
      if (widget.debugMode) {
        print('❌ $_instanceId: Failed to update scanner state: $e');
      }
    }
  }

  void _forceRefocus() {
    if (!mounted) return;
    
    try {
      platform.invokeMethod('forceRefocus');
      if (widget.debugMode) {
        print('🔍 $_instanceId: Force refocus called on Android');
      }
    } catch (e) {
      if (widget.debugMode) {
        print('❌ $_instanceId: Force refocus failed: $e');
      }
    }
  }

  void _handleBarcodeScanned(String barcode) {
    if (!mounted) return;
    
    if (barcode.trim().isEmpty) {
      if (widget.debugMode) {
        print('🚫 Empty barcode ignored');
      }
      return;
    }
    
    if (!widget.enabled) {
      if (widget.debugMode) {
        print('🚫 Scan blocked: enabled=${widget.enabled}');
      }
      return;
    }

    if (_isProcessing) {
      if (widget.debugMode) {
        print('🚫 Scan blocked: currently processing');
      }
      return;
    }

    final cleanBarcode = barcode.trim();
    final now = DateTime.now();
    
    // Check for duplicate scans
    if (!widget.allowDuplicateScans &&
        _lastScannedBarcode == cleanBarcode && 
        _lastScanTime != null && 
        now.difference(_lastScanTime!) < widget.debounceDuration) {
      if (widget.debugMode) {
        print('🔄 Duplicate ignored: $cleanBarcode');
      }
      return;
    }

    // Set processing state to prevent rapid scans
    _setProcessingState(true);
    
    // Cancel existing timer
    _debounceTimer?.cancel();
    _debounceTimer = Timer(widget.debounceDuration, () {
      if (mounted) {
        _setProcessingState(false);
        _forceRefocus();
        if (widget.debugMode) {
          print('🔄 Processing complete - ready for next scan');
        }
      }
    });
    
    // Update tracking variables
    _lastScannedBarcode = cleanBarcode;
    _lastScanTime = now;
    
    if (widget.debugMode) {
      print('🎯 BARCODE SCANNED: "$cleanBarcode" (length: ${cleanBarcode.length})');
    }
    
    // Call the callback
    try {
      widget.onBarcodeScanned(cleanBarcode);
    } catch (e) {
      if (widget.debugMode) {
        print('❌ Error in callback: $e');
      }
      _setProcessingState(false);
      _forceRefocus();
    }
  }

  void _setProcessingState(bool isProcessing) {
    if (!mounted) return;
    
    if (_isProcessing != isProcessing) {
      setState(() {
        _isProcessing = isProcessing;
      });
      widget.onScanningStateChanged?.call(!isProcessing);
    }
  }

  @override
  void didUpdateWidget(HardwareBarcodeScanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.debugMode) {
      print('🔄 $_instanceId: Widget updated');
    }
    
    // Re-setup method channel
    _setupMethodChannel();
    
    if (oldWidget.enabled != widget.enabled || 
        oldWidget.debugMode != widget.debugMode) {
      _updateScannerState();
    }
    
    // Force refocus after update
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _forceRefocus();
      }
    });
  }

  @override
  void dispose() {
    if (widget.debugMode) {
      print('🛑 $_instanceId: Disposing');
    }
    
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _forceRefocus();
        if (widget.debugMode) {
          print('👆 $_instanceId: Tapped - requesting focus');
        }
      },
      child: widget.child,
    );
  }
}