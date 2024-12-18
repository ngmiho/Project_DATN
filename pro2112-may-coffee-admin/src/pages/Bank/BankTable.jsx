import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import { fetchAllBanks, deleteBankById } from "../../services/BankService";
import { Space, Table } from "antd";
import {
  EditOutlined,
  SearchOutlined,
  DeleteOutlined,
} from "@ant-design/icons";

const BankTable = () => {
  const [banks, setBanks] = useState([]);

  const getAllBanks = async () => {
    const res = await fetchAllBanks();

    if (res && res.result) {
      const data = res.result.map((element, index) => ({
        ...element,
        key: index + 1,
      }));
      setBanks(data);
    }
  };

  useEffect(() => {
    getAllBanks();
  }, []);

  const navigator = useNavigate();

  const deleteBank = async (id) => {
    const res = await deleteBankById(id);

    if (res && res.message) {
      toast.success(res.message);
      getAllBanks();
    } else {
      toast.error("Error deleting a bank!");
    }
  };

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
        <>
          <EditOutlined
            onClick={() => navigator(`/admin/edit-bank/${bank.id}`)}
            style={{ marginRight: 10 }}
          />
          <DeleteOutlined
            style={{ color: "red" }}
            onClick={() => deleteBank(bank.id)}
          />
        </>
      ),
    },
  ];

  return (
    <div className="templatemo-content-widget white-bg">
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          marginBottom: 20,
        }}
      >
        <h1>Bank Management</h1>
        <button
          className="templatemo-blue-button"
          onClick={() => navigator("/admin/banks/add")}
        >
          Add new bank
        </button>
      </div>
      <div className="panel panel-default table-responsive">
        <Table columns={columns} dataSource={banks} />
      </div>
    </div>
  );
};

export default BankTable;
