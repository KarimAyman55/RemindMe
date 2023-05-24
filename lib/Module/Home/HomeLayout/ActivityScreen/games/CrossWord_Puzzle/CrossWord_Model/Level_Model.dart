
class LevelModel{
  late int  firstIndex;
  final int ? lastIndexHor;
  final int ? currentGridSize;
  final dynamic inputCell;
  final dynamic qa;
  final int ? time;

  LevelModel({
    required this.firstIndex,
    this.lastIndexHor,
    this.currentGridSize,
    this.inputCell,
    this.qa,
    this.time,
  });
}