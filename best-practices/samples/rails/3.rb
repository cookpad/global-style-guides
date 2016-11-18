## Bad
class Recipe
  def self.local
    radius_maximum = Config.radius_maximum
    distance = radius_maximum  / (Math::PI * 6371)
    where(distance: distance)
  end
end

## Good
class Recipe
  def self.local
    GeoSquareQuery.new(self).to_relation
  end
end

class GeoSquareQuery
  EARTH_RADIUS_IN_KM = 6371

  def initialize(relation)
    @relation = relation
  end

  def to_relation
    relation.where(distance: distance)
  end

  private

    attr_reader :relation

    def distance
      radius_maximum / (Math::PI * EARTH_RADIUS_IN_KM)
    end

    def radius_maximum
      Config.radius_maximum
    end
end
