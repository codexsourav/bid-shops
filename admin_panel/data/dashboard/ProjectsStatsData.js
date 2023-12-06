import {
   Briefcase,
   ListTask,
   People,
   Bullseye
} from 'react-bootstrap-icons';

export const ProjectsStats = [
   {
      id: 1,
      title: "Users",
      value: 18,
      icon: <People size={18} />,
      statInfo: '<span className="text-dark me-2">10</span> Verified'
   },
   {
      id: 2,
      title: "Active Products",
      value: 132,
      icon: <ListTask size={18} />,
      statInfo: '<span className="text-dark me-2">28</span> Private'
   },
   {
      id: 3,
      title: "Live Bids",
      value: 12,
      icon: <Briefcase size={18} />,
      statInfo: '<span className="text-dark me-2">1</span> Bid'
   },
   {
      id: 4,
      title: "Orders",
      value: '76',
      icon: <Bullseye size={18} />,
      statInfo: '<span className="text-dark me-2">5</span> Cancel'
   }
];
export default ProjectsStats;
