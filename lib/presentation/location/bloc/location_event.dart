part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.started() = _Started;
  const factory LocationEvent.loadRegions() = _LoadRegions;
  const factory LocationEvent.searchRegions(String query) = _SearchRegions;
  const factory LocationEvent.selectRegion(RegionModel region) = _SelectRegion;
  const factory LocationEvent.filterByPopulation(int minPopulation, int maxPopulation) = _FilterByPopulation;
  const factory LocationEvent.filterByArea(double minArea, double maxArea) = _FilterByArea;
  const factory LocationEvent.clearFilters() = _ClearFilters;
} 