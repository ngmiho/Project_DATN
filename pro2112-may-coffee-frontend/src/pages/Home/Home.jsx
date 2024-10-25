import React, { useState, useEffect } from "react";
import { fetchGetAllDrinks } from "../../services/DrinkService";
import { Link } from "react-router-dom";
import { NumericFormat } from "react-number-format";
import { getVouchers } from "../../services/HomeService";
import { useTranslation } from "react-i18next";
import view0 from "../../view0.png";
import { Button, Container, Row, Col } from "reactstrap";

const Home = () => {
  const { t } = useTranslation();

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
      <div className="container shadow-sm rounded pt-3">
        <h1 className="font-bold break-normal text-2xl md:text-4xl">
          {t("Popular Drinks")}
        </h1>
        <div className="popular-drink row  ">
          {drinks &&
            drinks.length &&
            drinks.slice(0, 6).map((drink, index) => (
              <div
                className="w-full md:w-1/3 p-6 flex flex-col flex-grow flex-shrink"
                key={`drink-${index}`}
              >
                <div className="flex-1 bg-white rounded-t rounded-b-none overflow-hidden shadow-lg">
                  <a
                    href="#"
                    className="flex flex-wrap no-underline hover:no-underline"
                  >
                    <img
                      className="h-64 w-full rounded-t pb-6"
                      src={drink.images[0]}
                      alt={drink.name}
                    />
                    <div className="w-full font-bold text-xl text-gray-900 px-6">
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
                  </a>
                </div>
              </div>
            ))}
        </div>
      </div>

      <div class="flex flex-wrap justify-between pt-12 -mx-6">
        <div className="w-full md:w-1/3 p-6 flex flex-col flex-grow flex-shrink">
          <div className="flex-1 bg-white rounded-t rounded-b-none overflow-hidden shadow-lg ">
            <div className="flex-none mt-auto bg-white rounded-b rounded-t-none overflow-hidden shadow-lg p-6"></div>
            <div className="w-full font-bold text-xl text-gray-900 px-6">
              Không gian của quán
            </div>
          </div>
          <div className="flex-none mt-auto bg-white rounded-b rounded-t-none overflow-hidden shadow-lg p-6"></div>
        </div>
        <div className="w-full md:w-2/3 p-6 flex flex-col flex-grow flex-shrink">
          <div className="flex-1 bg-white rounded-t rounded-b-none overflow-hidden shadow-lg">
            <img
              className="h-full w-full rounded-t pb-6"
              style={{ backgroundImage: `url(${view0})`, height: 280 }}
            />
          </div>
        </div>
      </div>
    </>
  );
};

export default Home;
