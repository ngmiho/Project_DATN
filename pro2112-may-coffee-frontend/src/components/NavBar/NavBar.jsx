import React, { useState, useEffect, useContext } from "react";
import { Link, NavLink, useNavigate } from "react-router-dom";
import { StoreContext } from "../../context/StoreContext";
import { postLogout } from "../../services/AuthService";
import { useTranslation } from "react-i18next";
import {
  fetchAllCategories,
  fetchGetCategoryById,
} from "../../services/CategoryService";

const NavBar = () => {
  const [categories, setCategories] = useState([]);
  const { t } = useTranslation();
  const { i18n } = useTranslation();
  const changeLanguage = (lng) => {
    i18n.changeLanguage(lng);
  };

  const getAllCategories = async () => {
    const res = await fetchAllCategories();

    if (res && res.result) {
      setCategories(res.result);
    }
  };

  useEffect(() => {
    getAllCategories();
  }, []);

  const { token, setToken, cart } = useContext(StoreContext);

  const navigator = useNavigate();

  const handleLogout = async () => {
    const res = await postLogout({ token });

    if (res) {
      localStorage.removeItem("token");
      setToken("");
      navigator("/home");
    }
  };

  return (
    <nav className="navbar navbar-expand-lg bg-white border-bottom sticky-top">
      <div className="container">
        <NavLink className="navbar-brand" to={"/home"}>
          <h2 className="text-warning fst-italic">May Coffee & Tea</h2>
        </NavLink>

        <div className="collapse navbar-collapse" id="navbarSupportedContent">
          <ul className="navbar-nav me-auto mb-2 mb-lg-0">
            <div
              className="collapse navbar-collapse"
              id="navbarSupportedContent"
            >
              <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                <li className="nav-item">
                  <a
                    className="nav-link active"
                    aria-current="page"
                    href="/home"
                  >
                    {t("navHome")}
                  </a>
                </li>
                <li className="nav-item dropdown">
                  <a
                    className="nav-link dropdown-toggle"
                    href="#"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                  >
                    {t("navMenu")}
                  </a>
                  <ul className="dropdown-menu">
                    {categories &&
                      categories.length &&
                      categories
                        .filter((e) => e.id != 0)
                        .map((category, index) => (
                          <li>
                            <a
                              key={`category-${index}`}
                              href={`/menu/category/${category.id}`}
                              className="dropdown-item"
                              style={{ color: "inherit" }}
                              onMouseEnter={(e) =>
                                (e.target.style.backgroundColor = "#FFA500")
                              }
                              onMouseLeave={(e) =>
                                (e.target.style.backgroundColor = "inherit")
                              }
                            >
                              {category.name}
                            </a>
                          </li>
                        ))}
                  </ul>
                </li>
              </ul>
            </div>

            {token && (
              <li className="nav-item">
                <NavLink className="nav-link" to={"/order"}>
                  {t("navOrder")}
                </NavLink>
              </li>
            )}
            <button className="btn" onClick={() => changeLanguage("vi")}>
              <img src="/src/img/coVietNam.png" alt="" width={30} />
            </button>
            <button className="btn" onClick={() => changeLanguage("en")}>
              <img src="/src/img/coNuocAnh.png" alt="" width={30} />
            </button>
          </ul>
          <ul className="navbar-nav">
            {token && (
              <li className="nav-item align-content-center">
                <Link className="nav-link" to={"/cart"}>
                  <i className="fa-solid fa-cart-shopping position-relative">
                    {cart.totalItems > 0 && (
                      <span
                        className="position-absolute top-0 start-100 translate-middle badge rounded-circle border-light bg-danger"
                        style={{ fontSize: 7 }}
                      >
                        {cart.totalItems}
                        <span className="visually-hidden">unread messages</span>
                      </span>
                    )}
                  </i>
                </Link>
              </li>
            )}
            {!token ? (
              <li className="nav-item">
                <Link className="nav-link" to={"/login"}>
                  <button
                    type="button"
                    className="btn btn-warning"
                    style={{ minWidth: 130, height: 40 }}
                  >
                    {t("navLogin")}
                  </button>
                </Link>
              </li>
            ) : (
              <li className="nav-item dropdown">
                <a
                  className="nav-link dropdown-toggle"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  <i className="fa-solid fa-user"></i>
                </a>
                <ul className="dropdown-menu dropdown-menu-lg-end">
                  <li>
                    <NavLink
                      className="dropdown-item"
                      to={"/profile"}
                      style={{ color: "inherit" }}
                      onMouseEnter={(e) =>
                        (e.target.style.backgroundColor = "#FFA500")
                      }
                      onMouseLeave={(e) =>
                        (e.target.style.backgroundColor = "inherit")
                      }
                    >
                      {t("navProfile")}
                    </NavLink>
                  </li>
                  <li>
                    <NavLink
                      className="dropdown-item"
                      to={"/change-password"}
                      style={{ color: "inherit" }}
                      onMouseEnter={(e) =>
                        (e.target.style.backgroundColor = "#FFA500")
                      }
                      onMouseLeave={(e) =>
                        (e.target.style.backgroundColor = "inherit")
                      }
                    >
                      {t("navChangepassword")}
                    </NavLink>
                  </li>
                  <li>
                    <hr className="dropdown-divider" />
                  </li>
                  <li>
                    <button
                      className="dropdown-item"
                      onClick={handleLogout}
                      style={{ color: "inherit" }}
                      onMouseEnter={(e) =>
                        (e.target.style.backgroundColor = "#FFA500")
                      }
                      onMouseLeave={(e) =>
                        (e.target.style.backgroundColor = "inherit")
                      }
                    >
                      {t("navLogout")}
                    </button>
                  </li>
                </ul>
              </li>
            )}
          </ul>
        </div>
      </div>
    </nav>
  );
};

export default NavBar;
