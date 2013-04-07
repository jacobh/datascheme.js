define ['underscore'], (_) ->
    load = (schemas, data) ->
        mixin_schemas = _(schemas).map (schema) ->
            if _.isObject schema then _(schema).keys()[0] else schema

        object = _.object mixin_schemas, data
        out = {}
        for key, val of object
            if _.isObject val # this matches arrays and plain objects
                schema = _.chain(schemas).find((item) ->
                    if _.isObject item
                        _.chain(item).keys().contains(key).value()
                    ).values().value()[0]

                if _.isString schema[0]
                    # schema of plain object
                    out[key] = load schema, val

                else if _.isEmpty schema[0]
                    # schema of array (containing scalar items)
                    out[key] = val

                else
                    if _.isArray val
                        # schema of object array
                        out[key] = for item in val
                            load schema[0], item

                    else
                        # schema of object object
                        out[key] = {}
                        for obj_key, obj_obj of val
                            out[key][obj_key] = load schema[0], obj_obj

            else
                # scalar value
                out[key] = val

        out

    {
        load: load  
    }
