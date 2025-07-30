import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nosirovtask/data/local_data/regions_data.dart';
import 'package:nosirovtask/domain/model/region/region_model.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationState.initial()) {
    on<LocationEvent>((event, emit) async {
       
      await event.map( 
        started: (e) async => await _onStarted(e, emit),
        loadRegions: (e) async => await _onLoadRegions(e, emit),
        searchRegions: (e) async => _onSearchRegions(e, emit),
        selectRegion: (e) async => _onSelectRegion(e, emit),
        filterByPopulation: (e) async => _onFilterByPopulation(e, emit),
        filterByArea: (e) async => _onFilterByArea(e, emit),
        clearFilters: (e) async => _onClearFilters(e, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<LocationState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final regions = RegionsData.regions;
      emit(state.copyWith(
        isLoading: false,
        regions: regions,
        filteredRegions: regions,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load regions',
      ));
    }
  }

  Future<void> _onLoadRegions(_LoadRegions event, Emitter<LocationState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final regions = RegionsData.regions;
      emit(state.copyWith(
        isLoading: false,
        regions: regions,
        filteredRegions: regions,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load regions',
      ));
    }
  }

  void _onSearchRegions(_SearchRegions event, Emitter<LocationState> emit) {
    if (event.query.isEmpty) {
      emit(state.copyWith(
        filteredRegions: state.regions,
        searchQuery: '',
      ));
    } else {
      final filteredRegions = RegionsData.searchRegions(event.query);
      emit(state.copyWith(
        filteredRegions: filteredRegions,
        searchQuery: event.query,
      ));
    }
  }

  void _onSelectRegion(_SelectRegion event, Emitter<LocationState> emit) {
    emit(state.copyWith(
      selectedRegion: event.region,
    ));
  }

  void _onFilterByPopulation(_FilterByPopulation event, Emitter<LocationState> emit) {
    final filteredRegions = RegionsData.getRegionsByPopulationRange(
      event.minPopulation,
      event.maxPopulation,
    );
    emit(state.copyWith(
      filteredRegions: filteredRegions,
      populationFilter: PopulationFilter(
        minPopulation: event.minPopulation,
        maxPopulation: event.maxPopulation,
      ),
    ));
  }

  void _onFilterByArea(_FilterByArea event, Emitter<LocationState> emit) {
    final filteredRegions = RegionsData.getRegionsByAreaRange(
      event.minArea,
      event.maxArea,
    );
    emit(state.copyWith(
      filteredRegions: filteredRegions,
      areaFilter: AreaFilter(
        minArea: event.minArea,
        maxArea: event.maxArea,
      ),
    ));
  }

  void _onClearFilters(_ClearFilters event, Emitter<LocationState> emit) {
    emit(state.copyWith(
      filteredRegions: state.regions,
      searchQuery: '',
      populationFilter: null,
      areaFilter: null,
    ));
  }
} 