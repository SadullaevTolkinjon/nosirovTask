part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    @Default(false) bool isLoading,
    @Default([]) List<RegionModel> regions,
    @Default([]) List<RegionModel> filteredRegions,
    RegionModel? selectedRegion,
    @Default('') String searchQuery,
    PopulationFilter? populationFilter,
    AreaFilter? areaFilter,
    String? errorMessage,
  }) = _LocationState;

  factory LocationState.initial() => const LocationState(
        isLoading: false,
        regions: [],
        filteredRegions: [],
        searchQuery: '',
      );
}

@freezed
class PopulationFilter with _$PopulationFilter {
  const factory PopulationFilter({
    required int minPopulation,
    required int maxPopulation,
  }) = _PopulationFilter;
}

@freezed
class AreaFilter with _$AreaFilter {
  const factory AreaFilter({
    required double minArea,
    required double maxArea,
  }) = _AreaFilter;
} 