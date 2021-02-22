class ColorMap {
  String imgColorUrl, colorLabel;

  ColorMap({this.colorLabel, this.imgColorUrl});

  toMap() => {
        'imgColorUrl': imgColorUrl,
        'colorLabel': colorLabel,
      };

  ColorMap.fromJason(dynamic snapShot)
      : imgColorUrl = snapShot['imgColorUrl'],
        colorLabel = snapShot['colorLabel'];
}
