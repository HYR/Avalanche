class HomeScreen < PM::TableScreen
  title "Debts"
  stylesheet HomeStylesheet

  def on_load
    #set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    set_nav_bar_button :right, system_item: :add, action: :new_debt

    #@hello_world_label = append!(UILabel, :hello_world)
  end

  def nav_left_button
    mp 'Left button'
  end

  def nav_right_button
    mp 'Right button'
  end

  def table_data
    [{
      cells: [
        { title: "About this app",
          action: :view_debt,
          arguments: { data: [ "cell_1" ] }
          },
        { title: "Log out",
          action: :view_debt,
          arguments: { data: [ "cell_2" ] } }
      ]
    }]
  end

  def new_debt
    mp "New Debt"
    open_modal NewDebtScreen.new(nav_bar: true)
  end

  def view_debt
    mp "New Debt"
    open DebtDetailScreen.new(nav_bar: true)
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

