// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeDetailsModelAdapter extends TypeAdapter<RecipeDetailsModel> {
  @override
  final int typeId = 0;

  @override
  RecipeDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeDetailsModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      readyInMinutes: fields[2] as int?,
      servings: fields[3] as int?,
      image: fields[4] as String?,
      aggregateLikes: fields[5] as int?,
      healthScore: fields[6] as int?,
      creditsText: fields[7] as String?,
      extendedIngredients: (fields[8] as List?)?.cast<ExtendedIngredients>(),
    )..isFavorite = fields[9] as bool;
  }

  @override
  void write(BinaryWriter writer, RecipeDetailsModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.readyInMinutes)
      ..writeByte(3)
      ..write(obj.servings)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.aggregateLikes)
      ..writeByte(6)
      ..write(obj.healthScore)
      ..writeByte(7)
      ..write(obj.creditsText)
      ..writeByte(8)
      ..write(obj.extendedIngredients)
      ..writeByte(9)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExtendedIngredientsAdapter extends TypeAdapter<ExtendedIngredients> {
  @override
  final int typeId = 1;

  @override
  ExtendedIngredients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExtendedIngredients(
      aisle: fields[0] as String?,
      image: fields[1] as String?,
      name: fields[2] as String?,
      measures: fields[3] as Measures?,
    );
  }

  @override
  void write(BinaryWriter writer, ExtendedIngredients obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.aisle)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.measures);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtendedIngredientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MeasuresAdapter extends TypeAdapter<Measures> {
  @override
  final int typeId = 2;

  @override
  Measures read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Measures(
      metric: fields[0] as Metric?,
    );
  }

  @override
  void write(BinaryWriter writer, Measures obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.metric);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasuresAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetricAdapter extends TypeAdapter<Metric> {
  @override
  final int typeId = 3;

  @override
  Metric read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Metric(
      amount: fields[0] as double?,
      unitShort: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Metric obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.unitShort);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetricAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
