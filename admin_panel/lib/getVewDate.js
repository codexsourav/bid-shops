export const viewDate = (datetime) => {
    const months = [
        "JAN", "FEB", "MAR", "APR", "MAY", "JUN",
        "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
    ];

    const date = new Date(datetime);
    // date.setFullYear(2023); // Set year to 2023
    // date.setMonth(11); // Set month to December (0-based)
    // date.setDate(20); // Set day of the month to 20
    // date.setHours(12); // Set hours to 12 (12:00 PM)
    // date.setMinutes(30); // Set minutes to 30

    const monthAbbreviation = months[date.getMonth()];
    const day = date.getDate();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const ampm = hours >= 12 ? 'PM' : 'AM';
    const formattedHours = hours % 12 === 0 ? 12 : hours % 12;
    const formattedMinutes = minutes < 10 ? `0${minutes}` : minutes;

    const formattedDate = `${monthAbbreviation} ${day} - ${formattedHours}:${formattedMinutes} ${ampm}`;
    return formattedDate;

}

export const setDateInpValue = (datetime) => {
    const date = new Date(datetime);
    const formattedDate = `${date.getFullYear()}-${date.getMonth() <= 9 ? "0" + date.getMonth() : date.getMonth()}-${date.getDay() <= 9 ? "0" + date.getDay() : date.getDay()}`;
    return formattedDate;
}

export const setTimeInpValue = (datetime) => {
    const date = new Date(datetime);
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const formattedDate = `${hours <= 9 ? "0" + hours : hours}:${minutes <= 9 ? "0" + minutes : minutes}`;
    return formattedDate;
}