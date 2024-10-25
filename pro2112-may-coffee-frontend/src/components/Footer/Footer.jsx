import React from "react";
import { useTranslation } from "react-i18next";

const Footer = () => {
  const { t } = useTranslation();

  return (
    <>
      <div className="flex w-full items-center font-sans p-8 md:p-24">
        <footer className="text-center text-lg-start bg-body-tertiary text-muted">
          <section className="pt-3">
            <div className="container text-center text-md-start mt-5">
              <div className="row mt-3">
                <div className="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                  <p>{t("Footer_P")}</p>
                </div>

                <div className="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                  <p>
                    <i className="fa fa-home me-3"></i>
                    QTSC 9 Building, Đ.Tô Ký, Tân Chánh Hiệp, Quận 12, Hồ Chí
                    Minh
                  </p>
                  <p>
                    <i className="fa fa-envelope me-3"></i>
                    minhhoang25498@gmail.com
                  </p>
                  <p>
                    <i className="fa fa-phone me-3"></i> 081 3833 677
                  </p>
                  <p>
                    <i className="fa fa-print me-3"></i> 081 3833 677
                  </p>
                </div>
              </div>
            </div>
          </section>
        </footer>
      </div>
      <footer className="bg-gray-900 text-white align-middle">
        <div className="container max-w-6xl mx-auto items-center px-2 py-8 ">
          <div
            className="text-center p-4"
            style={{ backgroundColor: "rgba(0, 0, 0, 0.05)" }}
          >
            May Coffee Shop © 2024 Copyright
          </div>
        </div>
      </footer>
    </>
  );
};

export default Footer;
