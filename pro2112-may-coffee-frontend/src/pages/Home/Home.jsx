import React, { useState, useEffect } from "react";
import { fetchGetAllDrinks } from "../../services/DrinkService";
import { Link } from "react-router-dom";
import HomeBannerCarousel from "./HomeBannerCarousel";
import { NumericFormat } from "react-number-format";
import { useTranslation } from "react-i18next";

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
      <HomeBannerCarousel />

      <div className="container shadow-sm rounded">
        <div className="row align-items-center my-5">
          <div className="row">
            <div className="col-6 col-md-4 col-lg-6">
              <div className="card border-0 shadow p-3 mb-5 mt-4 bg-body-tertiary rounded">
                <img
                  src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8nR06sXcsgqi0di8Rx96issMJcnyVGL0qGQ&s"
                  className="card-img-top h-50"
                  alt="#"
                />
              </div>
            </div>
            {drinks &&
              drinks.length &&
              drinks.slice(0, 6).map((drink, index) => (
                <div className="col-6 col-md-4 col-lg-3" key={`drink-${index}`}>
                  <Link
                    className="nav-link card border-0 shadow p-3 mb-5 bg-body-tertiary rounded"
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

        <div className="row align-items-center my-5">
          <div className="col-md-8">
            <img
              src="https://trungnguyencoffeevn.com/wp-content/uploads/2019/07/BBVIYT3.jpg"
              className="img-fluid rounded"
              alt="..."
              style={{ minWidth: 860 }}
            />
          </div>
          <div className="col-md-4 px-5">
            <div className="card-body text-center">
              <h5 className="card-title">
                Ly cà phê thơm ngon được làm từ hạt và bột cà phê Trung Nguyên
                chất lượng nhất!
              </h5>
            </div>
          </div>
        </div>

        <div className="row align-items-center my-5 py-4">
          <div className="col-md-4 px-5">
            <div className="card-body text-center">
              <h1 className="card-title">View Of</h1>
              <h1 className="card-title">May Coffee & Tea</h1>
            </div>
          </div>
          <div className="col-md-8 align-items-right">
            <img
              src="https://m.media-amazon.com/images/I/91dGZoIuy1L.jpg"
              className="img-fluid rounded"
              alt="..."
            />
          </div>
        </div>
      </div>
    </>
  );
};

export default Home;
