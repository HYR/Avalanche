class HomeScreen < PM::TableScreen
  title "Debts"
  stylesheet HomeStylesheet

  def on_load
    #set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    set_nav_bar_button :right, system_item: :add, action: :new_debt


    @debts = [{
      title: "Big Old Bank",
      type: "Mortgage",
      balance: 159_593.05,
    },
    {
      title: "Aunt Josephine",
      type: "Personal Loan",
      balance: 5_339.64,
    },
    {
      title: "Local Credit Union",
      type: "Car Loan",
      balance: 15_349.89,
    },
    {
      title: "MSU",
      type: "Student Loan",
      balance: 35_229.12,
    },
    {
      title: "Chase Visa",
      type: "Credit Card",
      sub_type: "Visa",
      balance: 10_947.33,
    },
    {
      title: "Chase Visa 2",
      type: "Credit Card",
      sub_type: "Visa",
      balance: 10_947.33,
    }]

    @debts.sort_by! do |h,v|
      v
    end
  end

  def nav_left_button
    mp 'Left button'
  end

  def nav_right_button
    mp 'Right button'
  end

  def table_data
    cells = []

    cells = @debts.map.with_index do |debt, index|

      cell_setup = {
        title: "",
        action: :view_debt,
        arguments: { debt: debt},
        properties: {
          debt: debt
        }
      }

      cell_type = if index == 0
        {
          cell_class: FocusDebtCell,
          height: stylesheet.focus_cell_height,
        }
      else
        {
          cell_class: DebtCell,
          height: stylesheet.cell_height
        }
      end

      cell_setup.merge!(cell_type)
    end

    mp cells

    [cells: cells]
  end

  def new_debt
    mp "New Debt"
    open_modal NewDebtScreen.new(nav_bar: true)
  end

  def view_debt(debt)
    mp "New Debt"
    open DebtDetailScreen.new(nav_bar: true, data: debt)
  end

  # You don't have to reapply styles to all UIViews, if you want to optimize,
  # another way to do it is tag the views you need to restyle in your stylesheet,
  # then only reapply the tagged views, like so:
  # def logo(st)
  #   st.frame = {t: 10, w: 200, h: 96}
  #   st.centered = :horizontal
  #   st.image = image.resource('logo')
  #   st.tag(:reapply_style)
  # end
  #
  # # Then in willAnimateRotationToInterfaceOrientation
  # find(:reapply_style).reapply_styles
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    find.all.reapply_styles
  end
end

