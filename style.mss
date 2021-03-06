// https://github.com/gregrs-uk/gb-leisure-carto/

Map {
  background-color: white;
}

#landuse {
  [natural='woodland'], 
  [natural='wood'],
  [landuse='forest'] {
    polygon-fill:#cfc;
  }
  [landuse='residential'], [landuse='industrial'],
  [landuse='retail'], [landuse='commercial'],
  [landuse='farmyard'] {
    polygon-fill:#f0f0f0;
  }
}

#water {
  // natural=water and waterway=riverbank
  polygon-fill:#eff;
  line-width:1;
  line-color:#bcf;
}

#waterways {
  [waterway='stream'],[waterway='drain'],[waterway='ditch'] {
    line-width:1;
    line-color:#bcf;
  }
  [waterway='river'],[waterway='canal'] {
    ::outer {
      line-width:4;
      line-color:#bcf;
      line-cap:round;
      line-join:bevel;
    }
    ::inner {
      line-width:2;
      line-color:#eff;
      line-cap:round;
      line-join:bevel;
    }
  }
}

@motorway_width: 4;
@primary_width: 3;
@secondary_width: 3;
@minor_width: 2;
@outer_width: 1;

#roads {
  ::outer {
    line-cap:round;
    line-join:bevel;
    [highway='motorway'],[highway='motorway_link'] {
      line-width:@motorway_width+@outer_width;
    }
    [highway='trunk'],[highway='trunk_link'],
    [highway='primary'],[highway='primary_link'] {
      line-width:@primary_width+@outer_width;
      line-color:#922;
    }
    [highway='secondary'],[highway='secondary_link'] {
      line-width:@secondary_width+@outer_width;
      line-color:#960;
    }
    [highway='tertiary'],[highway='tertiary_link'] {
      line-width:@secondary_width+@outer_width;
      line-color:#990;
    }
    [highway='unclassified'],[highway='residential'] {
      line-width:@minor_width+@outer_width;
      line-color:#333;
    }
    [highway='service'],
    [highway='track'][tracktype='grade1'],
    [highway='track'][tracktype='grade2'] {
      line-width:@minor_width+@outer_width;
      line-color:#aaa;
    }
    [highway='track'][tracktype!='grade1'][tracktype!='grade2'] {
      line-width:@minor_width+@outer_width;
      line-color:#aaa;
      line-dasharray:6,2;
      line-cap:butt;
    }
  }

  ::inner {
    line-cap:round;
    line-join:bevel;
    line-color:white;
    [highway='motorway'],[highway='motorway_link'] {
      line-width:@motorway_width;
      line-color:blue;
    }
    [highway='trunk'],[highway='trunk_link'],
    [highway='primary'],[highway='primary_link'] {
      line-width:@primary_width;
      line-color:#fbf;
    }
    [highway='secondary'],[highway='secondary_link'] {
      line-width:@secondary_width;
      line-color:#fc5;
    }
    [highway='tertiary'],[highway='tertiary_link'] {
      line-width:@secondary_width;
      line-color:#ff5;
    }
    [highway='unclassified'],[highway='residential'],
    [highway='service'],[highway='track'] {
      line-width:@minor_width;
    }
  }
}

#railway {
  line-width:1;
  line-color:black;
  line-cap:butt;
  line-join:bevel;
}

#buildings {
  polygon-fill:#eb6;
}

#paths {
  // from db: highway=footway/bridleway/cycleway
  // or anything with designation tag set
  line-width: 1.5;
  line-color:#999;
  line-dasharray:4,2;
  line-cap:butt;
  line-join:bevel;
  // probably public rights of way but no designation set
  [foot='designated'],[access='designated'],
  [foot='permissive'],[access='permissive'],
  [foot='yes'],[access='yes'] {
    line-color: #3b3;
  }
  // override colour if designation is explicitly set
  [designation='public_footpath'] {
    line-color: #f70;
  }
  [designation='public_bridleway'] {
    line-color: #66f;
  }
  [designation='restricted_byway'] {
    line-color: purple;
  }
  [designation='byway_open_to_all_traffic'] {
    line-color: red;
  }
}

#boundaries {
  line-width:0.5;
  [barrier='fence'] { line-color:#b83; }
  [barrier='hedge'] { line-color:#7b7; }
  [barrier='wall'] { line-color:#999; }
}

#contours {
  line-width:0.5;
  line-color:#f0f;
  line-opacity:0.6;
  line-cap:butt;
  line-dasharray:1,1;
}

#labels {
  text-name:[name];
  text-face-name:'Arial Regular';
  text-halo-fill: white; //fadeout(white,40%);
  text-size:8pt;
  text-halo-radius:1.5;
  text-fill: black; //#777;
  text-opacity:0.3;
  [place='city'] {
    text-size:35pt;
  }
  [place='town'] {
    text-size:28pt;
  }
  [place='suburb'],[place='neighbourhood']
  {
    text-size:21pt;
  }
  [place='village'],[place='hamlet'],
  [place='island'] {
    text-size:14pt;
  }
  [amenity='school'] {
    text-name:"'Sch'"
  }
  [amenity='place_of_worship'][religion='christian'] {
    text-name:"'Ch'"
  }
  [amenity='pub'] {
    text-name:"'Pub'"
  }
  [landuse='farmyard'], [place='farm'] {
    text-dy: -13;
  }
}

#grid {
  line-color:cyan;
  line-width:0.5;
  line-opacity:0.25;
}
