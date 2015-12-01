@view_details = (group_id) ->
  $.ajax '/front/work_groups/' + group_id + '/members_management',
    type: 'GET'
    dataType: 'script'