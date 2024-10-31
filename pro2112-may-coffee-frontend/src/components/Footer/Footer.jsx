import React from "react";
import { useTranslation } from "react-i18next";

const Footer = () => {
  const { t } = useTranslation();

  return (
    <footer className="text-center bg-warning-subtle text-warning-emphasis mt-5">
      <section className="pt-3">
        <div className="container text-center text-md-start mt-5">
          <div className="row mt-3">
            <div className="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
              <h6 className="text-uppercase fw-bold mb-4">May Coffee & Tea</h6>
              <p>{t("Footer_P")}</p>
            </div>

            <div className="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
              <h6 className="text-uppercase fw-bold mb-4">
                {t("Popular Drinks")}
              </h6>
              <p>
                <a href="#!" className="nav-link">
                  {t("Cà Phê Sữa Đá")}
                </a>
              </p>
              <p>
                <a href="#!" className="nav-link">
                  {t("Trà Đào Cam Sả")}
                </a>
              </p>
              <p>
                <a href="#!" className="nav-link">
                  {t("Freeze Trà Xanh")}
                </a>
              </p>
            </div>

            <div className="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
              <h6 className="text-uppercase fw-bold mb-4">{t("Liên hệ")}</h6>
              <p>
                <i className="fa fa-home me-3"></i>
                QTSC 9 Building, Đ.Tô Ký, Tân Chánh Hiệp, Quận 12, Hồ Chí Minh
              </p>
              <p>
                <i className="fa fa-envelope me-3"></i>
                minhhoang25498@gmail.com
              </p>
              <p>
                <i className="fa fa-phone me-3"></i> 0813 833 677
              </p>
              <p>
                <i className="fa fa-print me-3"></i> 0813 833 677
              </p>
            </div>
          </div>
        </div>
      </section>

      <div
        className="text-center p-4"
        style={{ backgroundColor: "rgba(0, 0, 0, 0.05)" }}
      >
        © 2024 Copyright
        <a href="#" style={{ textDecoration: "none", color: "#333" }}>
          <span> </span>May Coffee & Tea
        </a>
      </div>
    </footer>
  );
};

export default Footer;
