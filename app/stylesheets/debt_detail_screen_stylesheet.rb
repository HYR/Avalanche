class DebtDetailScreenStylesheet < ApplicationStylesheet
    # Add your view stylesheets here. You can then override styles if needed,
  # example:
  #   # include FooStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def test_label(st)
    st.text = 'rmq is awesome'
    st.font = font.system(12)
    st.color = color.black
    st.text_alignment = :center

    st.resize_to_fit_text
    st.size_to_fit
  end
end
