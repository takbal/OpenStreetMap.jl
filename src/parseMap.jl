### Julia OpenStreetMap Package ###
### MIT License                 ###
### Copyright 2014              ###

### Parse the data from an openStreetMap XML file ###
function parseMapXML(filename::String)

    # Parse the file
    street_map = LightXML.parse_file(filename)

    if LightXML.name(LightXML.root(street_map)) != "osm"
        throw(ArgumentError("Not an OpenStreetMap datafile."))
    end

    return street_map
end

function getOSMData(filename::String; nodes=false, highways=false, buildings=false, features=false)
    street_map = parseMapXML(filename)

    if nodes
        nodes = getNodes(street_map)
    end

    if highways
        highways = getHighways(street_map)
    end

    if buildings
        buildings = getBuildings(street_map)
    end

    if features
        features = getFeatures(street_map)
    end

    return nodes, highways, buildings, features
end
