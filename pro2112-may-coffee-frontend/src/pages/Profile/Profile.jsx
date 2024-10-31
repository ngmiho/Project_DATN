import React, { useEffect, useState } from "react";
import { Formik, Form } from "formik";
import * as Yup from "yup";
import FormikControl from "../../components/FormControl/FormikControl";
import { fetchGetMyInfo, putUpdateMyInfo } from "../../services/UserService";
import { toast } from "react-toastify";
import { useTranslation } from "react-i18next";

const Profile = () => {
  const { t } = useTranslation();
  const [myInfo, setMyInfo] = useState();

  useEffect(() => {
    getMyInfo();
  }, []);

  console.log("My info data: ", myInfo);

  const getMyInfo = async () => {
    const res = await fetchGetMyInfo();

    if (res && res.result) {
      const myInfo = res.result;

      setMyInfo({
        email: myInfo.email,
        phoneNumber: myInfo.phoneNumber,
        firstName: myInfo.firstName ? myInfo.firstName : "",
        lastName: myInfo.lastName ? myInfo.lastName : "",
        dob: myInfo.dob,
      });
    }
  };

  const initialValues = {
    email: "",
    phoneNumber: "",
    firstName: "",
    lastName: "",
    dob: null,
  };

  const regexPhoneNumber = /^(84|0[3|5|7|8|9])+([0-9]{8})/;

  const validationSchema = Yup.object({
    email: Yup.string().email(t("Invalid email")).required(t("required")),
    phoneNumber: Yup.string()
      .matches(regexPhoneNumber, t("phonevalid"))
      .required(t("required")),
    firstName: Yup.string().required(t("required")),
    lastName: Yup.string().required(t("required")),
  });

  const onSubmit = (values) => {
    console.log("Form values: ", values);
    const data = JSON.stringify(values);
    console.log("Updated data: ", data);
    handleUpdateMyInfo(values);
  };

  const handleUpdateMyInfo = async (data) => {
    const res = await putUpdateMyInfo(data);

    if (res && res.result) {
      console.log("Updated user info: ", res.result);
      toast.success(res.message);
      getMyInfo();
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
              <h2 className="text-center">{t("navProfile")}</h2>
              <Formik
                initialValues={myInfo || initialValues}
                validationSchema={validationSchema}
                onSubmit={onSubmit}
                validateOnChange={false}
                enableReinitialize
              >
                {(formik) => (
                  <Form>
                    <FormikControl
                      control="input"
                      label="Email"
                      name="email"
                      readOnly
                    />

                    <FormikControl
                      control="input"
                      label={t("Phone number")}
                      name="phoneNumber"
                    />

                    <FormikControl
                      control="input"
                      label={t("First name")}
                      name="firstName"
                    />

                    <FormikControl
                      control="input"
                      label={t("Last name")}
                      name="lastName"
                    />

                    <FormikControl
                      control="date"
                      label={t("Birth date")}
                      name="dob"
                    />

                    <div className="mb-3">
                      <button
                        type="submit"
                        className="btn btn-warning me-2"
                        style={{ minWidth: 130, height: 40 }}
                      >
                        {t("Save")}
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

export default Profile;
