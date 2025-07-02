<template>
    <div style="padding: 30px; font-size: 30px;">
        <span class="time" id="time">
            今天是：<span class="date">{{ nowTime }}</span>
            <span class="hour" style="margin-left: 5px;">{{ time.hour }}</span>
            <a class="split">:</a>
            <span class="minitus">{{ time.minitus }}</span>
            <a class="split">:</a>
            <span class="seconds">{{ time.seconds }}</span>
        </span>
    </div>
</template>

<script>
import { defineComponent, ref, onMounted } from 'vue';

export default defineComponent({
    name: "DateUtils",
    setup() {
        const time = ref({
            hour: "",
            minitus: "",
            seconds: ""
        });
        const nowTime = ref("");
        const week = [
            "星期天",
            "星期一",
            "星期二",
            "星期三",
            "星期四",
            "星期五",
            "星期六"
        ];

        const dateTime = () => {
            timeFormate();
            setTimeout(dateTime, 1000);
        };

        const timeFormate = () => {
            const newTime = new Date();
            time.value.hour = getIncrease(newTime.getHours(), 2);
            time.value.minitus = getIncrease(newTime.getMinutes(), 2);
            time.value.seconds = getIncrease(newTime.getSeconds(), 2);
            nowTime.value =
                getIncrease(newTime.getFullYear(), 4) +
                "年" +
                getIncrease(newTime.getMonth() + 1, 2) +
                "月" +
                getIncrease(newTime.getDate(), 2) +
                "日 " +
                week[newTime.getDay()];
        };

        const getIncrease = (num, digit) => {
            return num.toString().padStart(digit, '0'); // 使用 padStart 补零
        };

        onMounted(() => {
            dateTime(); // 在组件挂载时启动时间更新
        });

        return { time, nowTime };
    }
});
</script>

<style scoped>
.time {
    font-weight: bold;
}
.split {
    margin: 0 5px;
}
.date {
    color: #409EFF; /* 修改日期颜色 */
}
</style>
