class NewDebtScreen < PM::Screen
  stylesheet NewDebtStylesheet

  def on_load
    set_nav_bar_button :right, title: "Save", action: :done, type: :done

    btn = append!(UIButton, :close_modal).on(:tap) do |x|
     done
    end
  end

  def done
    mp "Close Modal Called."
    close
  end

end
