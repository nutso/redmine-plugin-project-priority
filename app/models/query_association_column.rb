class QueryAssociationColumn < QueryColumn
  def initialize(name, options)
    super(name, options)
    
    @association = options[:association]
    @field = options[:field]
    
    def value_object(object)
      value(object)
    end
    
    # TODO not sure if this is necessary (or functional)
    def value(object)
      # TODO split on __ for table and field
      if name == 'project__project_priority_id'
        id = (object.send @association).send @field
        return (id.nil? ? super(object) : ProjectPriority.find(id).to_s)
      else
        return "UNKNOWN -- #{name}"
      end
    end
    
    # TODO set self.groupable = association.column
  end
  
  def name
    "#{@association}__#{@field}"
  end
end