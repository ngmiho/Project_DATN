import React, { useContext } from "react";
import { Formik, Form } from "formik";
import * as Yup from "yup";
import FormikControl from "../../components/FormControl/FormikControl";
import { Link, useNavigate } from "react-router-dom";
import { StoreContext } from "../../context/StoreContext";
import { postLogin } from "../../services/AuthService";
import { toast } from "react-toastify";
import { useTranslation } from "react-i18next";

const Login = () => {
  const { t } = useTranslation();
  const { setToken } = useContext(StoreContext);

  const navigator = useNavigate();

  const initialValues = {
    email: "",
    password: "",
  };

  const validationSchema = Yup.object({
    email: Yup.string().email(t("Invalid email")).required(t("required")),
    password: Yup.string().required(t("required")).min(8, t("passMin")),
  });

  const onSubmit = (values) => {
    console.log("Form values: ", values);
    handleLogin(values);
  };

  const handleLogin = async (data) => {
    const res = await postLogin(data);

    if (res && res.result) {
      const token = res.result.token;
      setToken(token);
      localStorage.setItem("token", token);
      navigator("/home");
    } else {
      const message = res.response.data.message;
      toast.error(message);
    }
  };

  const API_BASE_URL = "http://localhost:8080";
  const OAUTH2_REDIRECT_URI = "http://localhost:3000/oauth2/redirect";

  const GOOGLE_AUTH_URL =
    API_BASE_URL +
    "/oauth2/authorize/google?redirect_uri=" +
    OAUTH2_REDIRECT_URI;

  return (
    <div className="container my-5">
      <div className="card text-bg-dark">
        <img
          src="https://thumbs.dreamstime.com/b/empty-wood-table-blur-cafe-coffee-shop-background-top-152533401.jpg"
          className="card-img"
          alt="..."
        />
        <div className="card-img-overlay mt-5">
          <div className="card col-md-6 mx-auto shadow border-1 rounded-4 p-5 mt-5">
            <div className="card-body">
              <h1 className="card-title text-center mb-5">{t("navLogin")}</h1>
              <Formik
                initialValues={initialValues}
                validationSchema={validationSchema}
                onSubmit={onSubmit}
                validateOnChange={false}
              >
                {(formik) => (
                  <Form>
                    <FormikControl
                      control="input"
                      label={t("Email")}
                      name="email"
                    />
                    <FormikControl
                      control="input"
                      type="password"
                      label={t("Password")}
                      name="password"
                    />

                    <div className="mb-3">
                      <button
                        type="submit"
                        className="btn btn-warning me-2"
                        style={{ minWidth: 130, height: 40 }}
                      >
                        {t("navLogin")}
                      </button>
                      <button
                        type="reset"
                        className="btn"
                        style={{
                          minWidth: 130,
                          height: 40,
                          backgroundColor: "#FEF08A",
                          color: "black",
                        }}
                        onMouseEnter={(e) =>
                          (e.target.style.backgroundColor = "#FDE047")
                        }
                        onMouseLeave={(e) =>
                          (e.target.style.backgroundColor = "#FEF08A")
                        }
                      >
                        {t("Cancel")}
                      </button>
                    </div>

                    <div className="d-flex justify-content-between mt-3">
                      <div className="form-text">
                        {t("Create a new account")}?{" "}
                        <Link
                          to={"/register"}
                          className="text-warning text-decoration-none"
                        >
                          {t("Click here")}
                        </Link>
                      </div>
                      <div className="form-text">
                        <Link
                          to={"/forgot-password"}
                          className="text-warning text-decoration-none ms-5"
                        >
                          {t("Forgot Password")}
                        </Link>
                      </div>
                    </div>
                  </Form>
                )}
              </Formik>
              <a
                className="social-login mt-3 text-decoration-none"
                href={GOOGLE_AUTH_URL}
              >
                <p className="mb-2 form-text">{t("Or sign in with")}</p>
                <div
                  className="btn btn-outline-warning text-light"
                  style={{ minWidth: 130, height: 40 }}
                >
                  <i className="fa-brands fa-google text-primary"></i>
                  <span className="text-primary fw-500 ms-2">G</span>
                  <span className="text-danger fw-500">o</span>
                  <span className="text-secondary fw-500">o</span>
                  <span className="text-primary fw-500">g</span>
                  <span className="text-success fw-500">l</span>
                  <span className="text-danger fw-500">e</span>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Login;
