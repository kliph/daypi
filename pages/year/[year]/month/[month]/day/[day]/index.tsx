import { useRouter } from "next/router";
import Daypi from "../../../../../../../src/daypi";

const Page = () => {
  const router = useRouter();
  const { year, month, day } = router.query;
  return (
    router.isReady && (
      <Daypi date={new Date(Number(year), Number(month) - 1, Number(day))} />
    )
  );
};

export default Page;
