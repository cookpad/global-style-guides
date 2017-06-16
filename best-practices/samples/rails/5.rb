## Bad
class Recipe
  scope :published_on, -> (date) { where(published_on: date) }
end

## Good
class Recipe
  def self.published_on(date)
    where(published_on: date)
  end
end

## Bad
class Recipe
  scope :fresh, -> {
    recently_active.
      published(4.weeks.ago).
      popular.
      approved
  }
end

## Good
class Recipe
  def self.fresh
    recently_active.
      published(4.weeks.ago).
      popular.
      approved
  end
end
