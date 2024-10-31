import React from "react";
import { Formik, Form } from "formik";
import * as Yup from "yup";
import FormikControl from "../../components/FormControl/FormikControl";
import { putForgotPassword } from "../../services/UserService";
import { toast } from "react-toastify";
import { useTranslation } from "react-i18next";

const ForgotPassword = () => {
  const { t } = useTranslation();
  const initialValues = {
    email: "",
  };

  const validationSchema = Yup.object({
    email: Yup.string().email(t("Invalid email")).required(t("required")),
  });

  const onSubmit = (values) => {
    console.log("Form values: ", values);

    handleForgotPassword(values);
  };

  const handleForgotPassword = async (data) => {
    const res = await putForgotPassword(data);

    if (res && res.code === 1000) {
      const message = res.message;
      toast.success(message);
    } else {
      const message = "Your email is not found!";
      toast.error(message);
    }
  };

  return (
    <div className="container my-5">
      <div className="card text-bg-dark">
        <img
          src="https://thumbs.dreamstime.com/b/empty-wood-table-blur-cafe-coffee-shop-background-top-152533401.jpg"
          className="card-img "
          alt="..."
          style={{ height: 600 }}
        />
        <div className="card-img-overlay mt-5">
          <div className="card col-md-6 mx-auto shadow border-1 rounded-4 p-5 mt-5">
            <div className="card-body">
              <h1 className="card-title text-center mb-4">
                {t("Forgot Password")}
              </h1>
              <Formik
                initialValues={initialValues}
                validationSchema={validationSchema}
                onSubmit={onSubmit}
                validateOnChange={false}
              >
                {(formik) => (
                  <Form>
                    <FormikControl control="input" label="Email" name="email" />

                    <div className="mb-3">
                      <button
                        type="submit"
                        className="btn btn-warning me-2"
                        style={{ minWidth: 130, height: 40 }}
                      >
                        {t("Reset Password")}
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

export default ForgotPassword;
