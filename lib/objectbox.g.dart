// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/job_recommadn_model.dart';
import 'model/response_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
    id: const obx_int.IdUid(1, 8674282274417045318),
    name: 'ResponseEntity',
    lastPropertyId: const obx_int.IdUid(3, 1790579728345477876),
    flags: 0,
    properties: <obx_int.ModelProperty>[
      obx_int.ModelProperty(
        id: const obx_int.IdUid(1, 7825899843157889196),
        name: 'id',
        type: 6,
        flags: 1,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(2, 858415754995691426),
        name: 'name',
        type: 9,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(3, 1790579728345477876),
        name: 'createdAt',
        type: 10,
        flags: 0,
      ),
    ],
    relations: <obx_int.ModelRelation>[],
    backlinks: <obx_int.ModelBacklink>[],
  ),
  obx_int.ModelEntity(
    id: const obx_int.IdUid(2, 2111752845351609842),
    name: 'JobRecommendationModel',
    lastPropertyId: const obx_int.IdUid(7, 2078087464892034455),
    flags: 0,
    properties: <obx_int.ModelProperty>[
      obx_int.ModelProperty(
        id: const obx_int.IdUid(1, 55062360812711104),
        name: 'id',
        type: 6,
        flags: 1,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(2, 5963087005412921489),
        name: 'recommendedJob',
        type: 9,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(3, 1023952184687639051),
        name: 'reason',
        type: 9,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(4, 3957683756944643653),
        name: 'requiredSkills',
        type: 30,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(5, 906691464311797972),
        name: 'estimatedLearningTime',
        type: 9,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(6, 2950470267230753931),
        name: 'potentialIncome',
        type: 9,
        flags: 0,
      ),
      obx_int.ModelProperty(
        id: const obx_int.IdUid(7, 2078087464892034455),
        name: 'marketDemand',
        type: 9,
        flags: 0,
      ),
    ],
    relations: <obx_int.ModelRelation>[],
    backlinks: <obx_int.ModelBacklink>[],
  ),
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore({
  String? directory,
  int? maxDBSizeInKB,
  int? maxDataSizeInKB,
  int? fileMode,
  int? maxReaders,
  bool queriesCaseSensitiveDefault = true,
  String? macosApplicationGroup,
}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(
    getObjectBoxModel(),
    directory: directory ?? (await defaultStoreDirectory()).path,
    maxDBSizeInKB: maxDBSizeInKB,
    maxDataSizeInKB: maxDataSizeInKB,
    fileMode: fileMode,
    maxReaders: maxReaders,
    queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
    macosApplicationGroup: macosApplicationGroup,
  );
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
    entities: _entities,
    lastEntityId: const obx_int.IdUid(2, 2111752845351609842),
    lastIndexId: const obx_int.IdUid(0, 0),
    lastRelationId: const obx_int.IdUid(0, 0),
    lastSequenceId: const obx_int.IdUid(0, 0),
    retiredEntityUids: const [],
    retiredIndexUids: const [],
    retiredPropertyUids: const [],
    retiredRelationUids: const [],
    modelVersion: 5,
    modelVersionParserMinimum: 5,
    version: 1,
  );

  final bindings = <Type, obx_int.EntityDefinition>{
    ResponseEntity: obx_int.EntityDefinition<ResponseEntity>(
      model: _entities[0],
      toOneRelations: (ResponseEntity object) => [],
      toManyRelations: (ResponseEntity object) => {},
      getId: (ResponseEntity object) => object.id,
      setId: (ResponseEntity object, int id) {
        object.id = id;
      },
      objectToFB: (ResponseEntity object, fb.Builder fbb) {
        final nameOffset = fbb.writeString(object.name);
        fbb.startTable(4);
        fbb.addInt64(0, object.id);
        fbb.addOffset(1, nameOffset);
        fbb.addInt64(2, object.createdAt.millisecondsSinceEpoch);
        fbb.finish(fbb.endTable());
        return object.id;
      },
      objectFromFB: (obx.Store store, ByteData fbData) {
        final buffer = fb.BufferContext(fbData);
        final rootOffset = buffer.derefObject(0);
        final nameParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 6, '');
        final createdAtParam = DateTime.fromMillisecondsSinceEpoch(
          const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0),
        );
        final object = ResponseEntity(
          name: nameParam,
          createdAt: createdAtParam,
        )..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

        return object;
      },
    ),
    JobRecommendationModel: obx_int.EntityDefinition<JobRecommendationModel>(
      model: _entities[1],
      toOneRelations: (JobRecommendationModel object) => [],
      toManyRelations: (JobRecommendationModel object) => {},
      getId: (JobRecommendationModel object) => object.id,
      setId: (JobRecommendationModel object, int id) {
        object.id = id;
      },
      objectToFB: (JobRecommendationModel object, fb.Builder fbb) {
        final recommendedJobOffset = fbb.writeString(object.recommendedJob);
        final reasonOffset = fbb.writeString(object.reason);
        final requiredSkillsOffset = fbb.writeList(
          object.requiredSkills.map(fbb.writeString).toList(growable: false),
        );
        final estimatedLearningTimeOffset = fbb.writeString(
          object.estimatedLearningTime,
        );
        final potentialIncomeOffset = fbb.writeString(object.potentialIncome);
        final marketDemandOffset = fbb.writeString(object.marketDemand);
        fbb.startTable(8);
        fbb.addInt64(0, object.id);
        fbb.addOffset(1, recommendedJobOffset);
        fbb.addOffset(2, reasonOffset);
        fbb.addOffset(3, requiredSkillsOffset);
        fbb.addOffset(4, estimatedLearningTimeOffset);
        fbb.addOffset(5, potentialIncomeOffset);
        fbb.addOffset(6, marketDemandOffset);
        fbb.finish(fbb.endTable());
        return object.id;
      },
      objectFromFB: (obx.Store store, ByteData fbData) {
        final buffer = fb.BufferContext(fbData);
        final rootOffset = buffer.derefObject(0);
        final recommendedJobParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 6, '');
        final reasonParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 8, '');
        final requiredSkillsParam = const fb.ListReader<String>(
          fb.StringReader(asciiOptimization: true),
          lazy: false,
        ).vTableGet(buffer, rootOffset, 10, []);
        final estimatedLearningTimeParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 12, '');
        final potentialIncomeParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 14, '');
        final marketDemandParam = const fb.StringReader(
          asciiOptimization: true,
        ).vTableGet(buffer, rootOffset, 16, '');
        final object = JobRecommendationModel(
          recommendedJob: recommendedJobParam,
          reason: reasonParam,
          requiredSkills: requiredSkillsParam,
          estimatedLearningTime: estimatedLearningTimeParam,
          potentialIncome: potentialIncomeParam,
          marketDemand: marketDemandParam,
        )..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

        return object;
      },
    ),
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [ResponseEntity] entity fields to define ObjectBox queries.
class ResponseEntity_ {
  /// See [ResponseEntity.id].
  static final id = obx.QueryIntegerProperty<ResponseEntity>(
    _entities[0].properties[0],
  );

  /// See [ResponseEntity.name].
  static final name = obx.QueryStringProperty<ResponseEntity>(
    _entities[0].properties[1],
  );

  /// See [ResponseEntity.createdAt].
  static final createdAt = obx.QueryDateProperty<ResponseEntity>(
    _entities[0].properties[2],
  );
}

/// [JobRecommendationModel] entity fields to define ObjectBox queries.
class JobRecommendationModel_ {
  /// See [JobRecommendationModel.id].
  static final id = obx.QueryIntegerProperty<JobRecommendationModel>(
    _entities[1].properties[0],
  );

  /// See [JobRecommendationModel.recommendedJob].
  static final recommendedJob = obx.QueryStringProperty<JobRecommendationModel>(
    _entities[1].properties[1],
  );

  /// See [JobRecommendationModel.reason].
  static final reason = obx.QueryStringProperty<JobRecommendationModel>(
    _entities[1].properties[2],
  );

  /// See [JobRecommendationModel.requiredSkills].
  static final requiredSkills =
      obx.QueryStringVectorProperty<JobRecommendationModel>(
        _entities[1].properties[3],
      );

  /// See [JobRecommendationModel.estimatedLearningTime].
  static final estimatedLearningTime =
      obx.QueryStringProperty<JobRecommendationModel>(
        _entities[1].properties[4],
      );

  /// See [JobRecommendationModel.potentialIncome].
  static final potentialIncome =
      obx.QueryStringProperty<JobRecommendationModel>(
        _entities[1].properties[5],
      );

  /// See [JobRecommendationModel.marketDemand].
  static final marketDemand = obx.QueryStringProperty<JobRecommendationModel>(
    _entities[1].properties[6],
  );
}
