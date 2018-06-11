# Rake

- <a name="avoid-methods-inside-rake-namespace"></a>
  Avoid defining methods inside of Rake namespaces. This will define methods at the top level and interfere with things
  like factories.
  <sup>[link](#avoid-methods-inside-rake-namespace)</sup>

- <a name="avoid-permanent-rake-logic"></a>
  Except in one offs, avoid defining new logic in rake tasks, use a class instead.
  <sup>[link](#avoid-permanent-rake-logic)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
    ## Bad
    namespace :users do
      desc "Decrements all users rank"
      task decrement_rank: :environment do
        User.where("rank > 0").update_all("rank = rank - 1")
      end
    end

    ## Good
    namespace :users do
      desc "Decrements all users rank"
      task decrement_rank: :environment do
        User.decrement_all_ranks
      end
    end
    ```
  </details>

