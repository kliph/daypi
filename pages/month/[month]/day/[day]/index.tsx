import { useRouter } from "next/router";
import { format } from "date-fns";
import Daypi from "../../../../../src/daypi";

const Page = () => {
  const router = useRouter();
  const { month, day } = router.query;
  const year = format(new Date(), "yyyy");
  return (
    router.isReady && (
      <Daypi date={new Date(Number(year), Number(month) - 1, Number(day))} />
    )
  );
};

export default Page;
