// import node module libraries
import React from "react";
import Link from 'next/link';
import { Card, Table, Dropdown, Image } from 'react-bootstrap';
import { MoreVertical } from 'react-feather';

// import required data files
import TeamsData from "data/dashboard/TeamsData";
import { setStorage } from "lib/storage";
import { warnToast } from "lib/showToast";

const Users = () => {

    const CustomToggle = React.forwardRef(({ children, onClick }, ref) => (
        (<Link
            href=""
            ref={ref}
            onClick={(e) => {
                e.preventDefault();
                onClick(e);
            }}
            className="text-muted text-primary-hover">
            {children}
        </Link>)
    ));

    CustomToggle.displayName = 'CustomToggle';

    const ActionMenu = () => {
        return (
            <Dropdown>
                <Dropdown.Toggle as={CustomToggle}>
                    <MoreVertical size="15px" className="text-muted" />
                </Dropdown.Toggle>
                <Dropdown.Menu align={'end'}>
                    <Dropdown.Item eventKey="1">
                        Block User
                    </Dropdown.Item>
                    <Dropdown.Item eventKey="2">
                        Delete User
                    </Dropdown.Item>
                </Dropdown.Menu>
            </Dropdown>
        );
    };

    return (
        <Card className="h-100">
            <Card.Header className="bg-white py-4">
                <h4 className="mb-0">New Users </h4>
            </Card.Header>
            <Table responsive className="text-nowrap">
                <thead className="table-light">
                    <tr>
                        <th>Name</th>
                        <th>Status</th>
                        <th>Email Verified</th>
                        <th>Total Bids</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {TeamsData.map((item, index) => {
                        return (
                            <tr key={index}>
                                <td className="align-middle">
                                    <div className="d-flex align-items-center">
                                        <div>
                                            <Image src={item.image} alt="" className="avatar-md avatar rounded-circle" />
                                        </div>
                                        <div className="ms-3 lh-1">
                                            <h5 className=" mb-1">{item.name}</h5>
                                            <p className="mb-0">{item.email}</p>
                                        </div>
                                    </div>
                                </td>
                                <td className="align-middle">Active</td>
                                <td className="align-middle">NO</td>
                                <td className="align-middle">{item.lastActivity}</td>
                                <td className="align-middle">
                                    <ActionMenu />
                                </td>
                            </tr>
                        )
                    })}
                </tbody>
            </Table>
            <button onClick={() => {
                warnToast("hi");
            }}>
                Click
            </button>
        </Card>
    )
}

export default Users