class DebtsScreen < UITableViewController
  include ProMotion::ScreenModule
  include ProMotion::Table::Refreshable

  attr_accessor :debts

  stylesheet DebtsScreenStylesheet
  CELL_ID = "DebtCell"
  FOCUS_CELL_ID = "FocusCell"

  def self.new(args = {})
    s = self.alloc.initWithStyle(UITableViewStylePlain)
    s.screen_init(args) if s.respond_to?(:screen_init)
    s
  end

  def on_load
    self.title = "Custom Debts Screen"
    set_nav_bar_button :right, system_item: :compose, action: :compose_message

    view.tap do |table|
      table.delegate = self
      table.dataSource = self
    end

    view.dataSource = view.delegate = self



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
    }]

    @debts.sort_by! do |h|
      h["title"]
    end
  end

  def compose_message
    rmq.alert(nil, "This is a future feature")
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @debts.count
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    if index_path.row == 0
      stylesheet.focus_cell_height
    else
      stylesheet.cell_height
    end
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    row = index_path.row

    mp row

    data_row = @debts[row]

    if row == 0
      mp FOCUS_CELL_ID
      cell = table_view.dequeueReusableCellWithIdentifier(FOCUS_CELL_ID) || begin
        create(FocusDebtCell, :focus_cell, reuse_identifier: FOCUS_CELL_ID).on(:tap) do
          open DebtDetailScreen
        end.get
      end
    else
      mp CELL_ID
      cell = table_view.dequeueReusableCellWithIdentifier(CELL_ID) || begin
        create(DebtCell, :cell, reuse_identifier: CELL_ID).on(:tap) do
          open DebtDetailScreen
        end.get
      end
    end

    cell.update(data_row)
    cell
  end

end
