module Query::Params
  
  def query_params(model)
    query = [ build_query_string(model) ]
    query << build_query_array
    query.flatten
  end

  def build_query_string(model)
    filtered_params.collect{ |param| "#{param_key(param)} #{query_operator(model, param)} ?" }.join(" and ")
  end

  def build_query_array
    filtered_params.collect{ |param| param_value(param) }
  end

  def filtered_params
    params.except(:page, :per_page, :action, :controller, :auth_token, :reportable_id, :reportable_type)
  end

  def query_operator(model, param)
    model.columns_hash[param_key(param)].type == :string ? "~*" : "="
  end

  def param_key(param)
    param[0]
  end

  def param_value(param)
    param[1]
  end
end
