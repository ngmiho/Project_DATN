import { useState } from "react";
import { Space, Table } from "antd";

const BankTable2 = () => {
  const [banks, setBanks] = useState([]);

  const columns = [
    {
      title: "#",
      dataIndex: "key",
      rowScope: "row",
    },
    {
      title: "Name",
      dataIndex: "name",
      key: "name",
      defaultSortOrder: "descend",
      sorter: (a, b) => a.name.length - b.name.length,
      sortDirections: ["descend"],
    },
    {
      title: "Action",
      dataIndex: "id",
      key: "action",
      render: (_, bank) => (
        <Space size="middle">
          <button
            className="templatemo-edit-btn"
            onClick={() => navigator(`/admin/edit-bank2/${bank.id}`)}
          >
            Edit
          </button>
          <button
            className="templatemo-edit-btn"
            onClick={() => deleteBank(bank.id)}
          >
            Delete
          </button>
        </Space>
      ),
    },
  ];

  return (
    <div className="templatemo-content-widget white-bg">
      <div>
        <h2>Bank Management</h2>
        <button
          className="templatemo-blue-button"
          onClick={() => navigator("/admin/banks2/add")}
        >
          Add new bank
        </button>
      </div>
      <div>
        <Table columns={columns} dataSource={banks} />
      </div>
    </div>
  );
};

export default BankTable2;
