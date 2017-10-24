## Bad
def run
  mark_related_items(:spam) if spam_detected?
end

## Good
def run
  if spam_detected?
    mark_related_items(:spam)
  end
end

## OK for guard clauses, separate by space
def approve
  return if approved?
  return if unapprovable?

  update!(approved: true)
end
