Module Paginate

def paginate page, per_page, path, opts = nil
opts ||= {}
opts[:params] ||= {}
raise "'rows' or 'start' params should not be set when using +paginate+" if ["start", "rows"].include?(opts[:params].keys)
execute build_paginated_request(page, per_page, path, opts)
end

end