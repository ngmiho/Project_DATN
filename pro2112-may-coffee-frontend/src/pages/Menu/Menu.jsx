import React, { useState, useEffect } from "react";
import { NavLink, Link, useParams } from "react-router-dom";
import {
  fetchAllCategories,
  fetchGetCategoryById,
} from "../../services/CategoryService";
import {
  fetchGetAllDrinks,
  fetchGetDrinksByCategoryId,
} from "../../services/DrinkService";
import { NumericFormat } from "react-number-format";
import { useTranslation } from "react-i18next";
import "./Menu.css";

const Menu = () => {
  const { t } = useTranslation();
  const [categories, setCategories] = useState([]);
  const [drinks, setDrinks] = useState([]);
  const [category, setCategory] = useState({ name: "Menu" });

  const { id } = useParams();

  const getAllCategories = async () => {
    const res = await fetchAllCategories();

    if (res && res.result) {
      setCategories(res.result);
    }
  };

  useEffect(() => {
    getAllCategories();
  }, []);

  const getAllDrinks = async () => {
    const res = await fetchGetAllDrinks();

    if (res && res.result) {
      setDrinks(res.result);
    }
  };

  const getDrinksByCategoryId = async (id) => {
    const res = await fetchGetDrinksByCategoryId(id);

    if (res && res.result) {
      setDrinks(res.result);
      console.log("Drink data by category: ", res.result);
    }
  };

  const getCategoryById = async (id) => {
    const res = await fetchGetCategoryById(id);

    if (res && res.result) {
      console.log("Category: ", res.result);
      setCategory(res.result);
    }
  };

  useEffect(() => {
    if (id) {
      getDrinksByCategoryId(id);
      getCategoryById(id);
    } else {
      getAllDrinks();
      setCategory({ name: "Menu" });
    }
  }, [id]);

  return (
    <div className="container mt-5">
      <div className="row">
        <div className="col-md-3">
          <div className="list-group list-group-flush shadow-sm rounded">
            {categories &&
              categories.length &&
              categories
                .filter((e) => e.id != 0)
                .map((category, index) => (
                  <NavLink
                    key={`category-${index}`}
                    to={`/menu/category/${category.id}`}
                    className="list-group-item list-group-item-light list-group-item-action border-0 brown-active"
                  >
                    {category.name}
                  </NavLink>
                ))}
          </div>
        </div>
        <div className="col-md-9 shadow-sm rounded">
          <div className="category-drink row">
            <h2>{category ? category.name : "Menu"}</h2>
            {drinks &&
              drinks.length &&
              drinks.map((drink, index) => (
                <div
                  className="col-6 col-md-4 mb-3 shadow-sm"
                  key={`drink-${index}`}
                >
                  <Link
                    className="nav-link card border-0"
                    to={`/drinks/${drink.id}`}
                  >
                    <img
                      src={drink.images[0]}
                      className="card-img-top h-50"
                      alt={drink.name}
                    />
                    <div className="card-body px-0">
                      <h5 className="card-title">{drink.name}</h5>
                      <NumericFormat
                        className="card-text text-secondary"
                        value={drink.price}
                        displayType="text"
                        thousandSeparator=","
                        suffix=" đ"
                      />
                    </div>
                  </Link>
                </div>
              ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Menu;
