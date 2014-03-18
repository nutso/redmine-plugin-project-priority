class QueryAssociationColumn < QueryColumn
  def initialize(name, options)
    super(name, options)
    
    @association = options[:association]
    @field = options[:field]
    
    # TODO not sure if this is necessary (or functional)
    def value(object)
      if name == 'project_priority_id'
        return ProjectPriority.find((object.send @association).send @field).to_s
      else
        return "UNKNOWN -- #{name}"
      end
    end
    
    # TODO set self.groupable = association.column
  end
  
  def name
    "#{@association}.#{@field}"
  end
end