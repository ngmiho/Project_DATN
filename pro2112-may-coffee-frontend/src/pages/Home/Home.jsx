import React, { useState, useEffect } from "react";
import { fetchGetAllDrinks } from "../../services/DrinkService";
import { Link } from "react-router-dom";
import HomeBannerCarousel from "./HomeBannerCarousel";
import { NumericFormat } from "react-number-format";
import { getVouchers } from "../../services/HomeService";
import {useTranslation} from 'react-i18next'

const Home = () => {
  const {t} = useTranslation();

  const [drinks, setDrinks] = useState([]);
  const [vouchers, setVouchers] = useState([]);

  const getAllDrinks = async () => {
    const res = await fetchGetAllDrinks();

    if (res && res.result) {
      setDrinks(res.result);
      console.log("Drink data: ", res);
    }
  };

  useEffect(() => {
    getAllDrinks();
  }, []);

  return (
    <>
      <HomeBannerCarousel />
      <div className="container shadow-sm rounded pt-3">
        <h4>{t('Popular Drinks')}</h4>
        <div className="popular-drink row  ">
          {drinks &&
            drinks.length &&
            drinks.map((drink, index) => (
              <div
                className="col-6 col-md-4 col-lg-3 mb-3"
                key={`drink-${index}`}
              >
                <div className="card border-0">
                  <img
                    src={drink.images[0]}
                    className="card-img-top h-50"
                    alt={drink.name}
                  />
                  <div className="card-body px-0">
                    <Link to={`/drinks/${drink.id}`} className="nav-link">
                      <h5 className="card-title">{drink.name}</h5>
                    </Link>
                    <NumericFormat
                      className="card-text text-secondary"
                      value={drink.price}
                      displayType="text"
                      thousandSeparator=","
                      suffix=" đ"
                    />
                  </div>
                </div>
              </div>
            ))}
        </div>
      </div>
    </>
  );
};

export default Home;
