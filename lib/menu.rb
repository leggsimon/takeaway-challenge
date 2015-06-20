class Menu

  attr_accessor :selected_items


  def initialize

    @menu_items = {pizza: 9.99,
                  fried_chicken: 4.99,
                  coke: 0.99,
                  beer: 2.89,
                  wine: 6.99
                  }

    @selected_items = {}

  end

  def show
    menu_items
  end

  def choose quantity, menu_selection
    if selection_has_already_been_chosen? menu_selection
      update_existing_items quantity, menu_selection
    else
      add_new_item quantity, menu_selection
    end
  end

  def selections
    selected_items
  end

private

  attr_reader :menu_items

  def selection_has_already_been_chosen? menu_selection
    selected_items.has_key? menu_selection
  end

  def add_new_item quantity, menu_selection
    menu_items.select do |menu_item,v|
      if menu_item == menu_selection.to_sym
        self.selected_items[menu_item] = quantity
      end
    end
  end

  def update_existing_items quantity, menu_selection
    current_quantity = selected_items[menu_selection.to_sym]
    selected_items[menu_selection.to_sym] = current_quantity + quantity
  end


end