import React from "react";
import { Formik, Form } from "formik";
import * as Yup from "yup";
import FormikControl from "../../components/FormControl/FormikControl";
import { postRegister } from "../../services/UserService";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import { useTranslation } from "react-i18next";

const Register = () => {
  const { t } = useTranslation();
  const navigator = useNavigate();

  const initialValues = {
    email: "",
    phoneNumber: "",
    firstName: "",
    lastName: "",
    password: "",
    confirmedPassword: "",
  };

  const regexPhoneNumber = /^(84|0[3|5|7|8|9])+([0-9]{8})/;

  const validationSchema = Yup.object({
    firstName: Yup.string().required(t("required")),
    lastName: Yup.string().required(t("required")),
    email: Yup.string().email(t("Invalid email")).required(t("required")),
    phoneNumber: Yup.string()
      .matches(regexPhoneNumber, t("phonevalid"))
      .required(t("required")),
    password: Yup.string().required(t("required")).min(8, t("passMin")),
    confirmedPassword: Yup.string()
      .required(t("required"))
      .oneOf([Yup.ref("password")], t("confirmPass")),
  });

  const onSubmit = (values) => {
    console.log("Form values: ", values);
    console.log("Saved data: ", JSON.stringify(values));
    handleRegister(values);
  };

  const handleRegister = async (data) => {
    const res = await postRegister(data);

    if (res && res.result) {
      console.log("Register user: ", res.result);
      navigator("/login");
    } else {
      console.log(res.response.data);
      const message = res.response.data.message;
      toast.error(message);
    }
  };

  return (
    <div className="container my-5">
      <div className="card text-bg-dark">
        <img
          src="https://thumbs.dreamstime.com/b/empty-wood-table-blur-cafe-coffee-shop-background-top-152533401.jpg"
          className="card-img"
          alt="..."
        />
        <div className="card-img-overlay">
          <div className="card col-md-6 mx-auto shadow border-1 rounded-4 p-5">
            <div className="card-body">
              <h1 className="card-title text-center mb-5">{t("Register")}</h1>
              <Formik
                initialValues={initialValues}
                validationSchema={validationSchema}
                onSubmit={onSubmit}
                validateOnChange={false}
              >
                {(formik) => (
                  <Form>
                    <FormikControl control="input" label="Email" name="email" />
                    <div className="row">
                      <div className="col-6">
                        <FormikControl
                          control="input"
                          label={t("First name")}
                          name="firstName"
                        />
                      </div>
                      <div className="col-6">
                        <FormikControl
                          control="input"
                          label={t("Last name")}
                          name="lastName"
                        />
                      </div>
                    </div>
                    <FormikControl
                      control="input"
                      label={t("Phone number")}
                      name="phoneNumber"
                    />
                    <FormikControl
                      control="input"
                      type="password"
                      label={t("Password")}
                      name="password"
                    />
                    <FormikControl
                      control="input"
                      type="password"
                      label={t("Confirmed Password")}
                      name="confirmedPassword"
                    />

                    <div className="pt-3">
                      <button
                        type="submit"
                        className="btn btn-warning me-2"
                        style={{ minWidth: 130, height: 40 }}
                      >
                        {t("Register")}
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
                  </Form>
                )}
              </Formik>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Register;
