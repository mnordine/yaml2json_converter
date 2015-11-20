import 'dart:async';
import 'package:barback/barback.dart';
import 'package:yaml2json/yaml2json.dart';

class Yaml2JsonTransformer extends Transformer
{
  Yaml2JsonTransformer.asPlugin();

  String get allowedExtensions => '.yaml';

  Future apply(Transform transform) async
  {
    var yaml = await transform.primaryInput.readAsString();
    var id = transform.primaryInput.id.changeExtension('.json');
    var newContent = yaml2json(yaml);
    transform.addOutput(new Asset.fromString(id, newContent));
  }
}