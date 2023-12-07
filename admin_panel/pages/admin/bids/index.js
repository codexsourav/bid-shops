// import node module libraries
import Link from 'next/link';
import { ProgressBar, Col, Row, Card, Table, Image, Dropdown, Spinner } from 'react-bootstrap';

// import required data files
import ActiveProjectsData from "data/dashboard/ActiveProjectsData";
import React, { useEffect, useState } from 'react';
import makeApi, { apiUrl } from 'lib/makeApi';
import { viewDate } from 'lib/getVewDate';




const Bids = () => {

    const [data, setData] = useState(null)

    const getBids = async () => {
        const data = await makeApi("/api/bids", "GET");
        setData(data)
    }

    useEffect(() => {
        getBids();
    }, [])

    if (data == null) {
        return <div style={{ width: "100%", height: "100vh", display: "flex", justifyContent: "Center", alignItems: "center" }}>
            <Spinner animation="border" role="status">
                <span className="visually-hidden">Loading...</span>
            </Spinner>
        </div>
    }

    return (
        <Row className=" text-center">
            <Col md={12} xs={12}>
                <Card>
                    <Card.Header className="bg-white  py-4">
                        <h4 className="mb-0">All Bids</h4>
                    </Card.Header>
                    <Table responsive className="text-nowrap mb-0">
                        <thead className="table-light">
                            <tr>
                                <th>Product name</th>
                                <th>Time Durations</th>
                                <th>Unique Bid</th>
                                <th>Bid User</th>
                                <th>Total Bids</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {data.map((item, index) => {
                                return (
                                    <tr key={index}>
                                        <td className="align-middle">
                                            <div className="d-flex align-items-center">
                                                <div>
                                                    <div className={`icon-shape icon-md border p-4 rounded-1 ${item.brandLogoBg}`}>
                                                        <Image src={apiUrl + "/" + item.image} alt="" width={40} height={40} />
                                                    </div>
                                                </div>
                                                <div className="ms-3 lh-1">
                                                    <h5 className=" mb-1">
                                                        <Link href="#" className="text-inherit">{item.title}</Link></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td className="align-middle">{viewDate(item.startDate)} - {viewDate(item.endDate)}</td>
                                        <td className="align-middle">{viewDate(item.endDate)}</td>
                                        <td className="align-middle">
                                            {/* <div className="avatar-group">
                                                {item.members.map((avatar, avatarIndex) => {
                                                    return (
                                                        <span className="avatar avatar-sm" key={avatarIndex}>
                                                            <Image alt="avatar" src={avatar.image} className="rounded-circle" />
                                                        </span>
                                                    )
                                                })}

                                            </div> */}
                                        </td>
                                        <td className="align-middle">{item.users.length} Bid</td>
                                        <td className="align-middle">
                                            <Link href={"/admin/bids/update/" + item._id}>Update</Link>
                                        </td>
                                    </tr>
                                )
                            })}
                        </tbody>
                    </Table>

                </Card>
            </Col>
        </Row>
    )
}

export default Bids