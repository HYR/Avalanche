class HomeStylesheet < ApplicationStylesheet
  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb

    @focus_label_height = 30
    @label_height = 24
  end

  def root_view(st)
    st.background_color = color.white
  end



  def focus_cell_height
    140
  end

  def focus_cell(st)
  end

  def focus_cell_name(st)
    st.frame = {l: 10, t: 5, w: 200, h: @focus_label_height}
    st.background_color = color.random
    st.color = color.white
    st.text = "TESTING THIS LABEL"
  end
  def focus_cell_type(st)
    st.frame = {l: 10, bp: 0, w: 200, h: @focus_label_height}
    st.background_color = color.random
    st.color = color.white
    st.text = "TESTING THIS LABEL"
  end



  def cell_height
    100
  end

  def cell(st)
  end

  def cell_content_view(st)
    st.background_color = color.random
  end

  def cell_name(st)
    st.frame = {l: 10, t: 5, w: 200, h: 24}
    st.background_color = color.random
    st.font = font.smaller
  end
  def cell_type(st)
    st.frame = {l: 10, bp: 0, w: 200, h: 24}
    st.background_color = color.random
    st.font = font.smaller
  end

end
