class DebtDetailScreenStylesheet < ApplicationStylesheet
    # Add your view stylesheets here. You can then override styles if needed,
  # example:
  #   # include FooStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def data(debt)
    @debt = debt
  end
  def root_view(st)
    st.background_color = color.white
  end

  def title_label(st)
    if @debt != nil
      st.text = @debt[:title]
    else
      st.text = 'No Title'
    end
    st.font = font.small
    st.color = color.black
    st.text_alignment = :center
    st.frame = {l: 0, t: 0, w: device.width, h: 300}

    st.background_color = color.random
    # st.resize_to_fit_text
    # st.size_to_fit
  end
end
