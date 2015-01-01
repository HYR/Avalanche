class DebtDetailScreen < PM::Screen
  stylesheet DebtDetailScreenStylesheet
  attr_accessor :data


  def on_load
    @debt = @data[:debt]

    self.title = @debt[:title].to_s

    set_nav_bar_button :right, title: "Edit", action: :edit, type: :edit
    #set_nav_bar_button :right, title: "Done", action: :done, type: :done

    stylesheet.data(@debt)
    l = append!(UILabel, :title_label)
  end

  def edit
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
