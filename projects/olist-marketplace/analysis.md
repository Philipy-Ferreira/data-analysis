
<img src="https://github.com/Philipy-Ferreira/data-analysis/blob/f2ec569b3e9861e2847a2ca5bfd3a7230096ca1e/Projects/unnamed.jpg" width="200" align="center"/>

Olist is a Brazilian retail technology company that provides infrastructure for small and medium businesses to sell across multiple online marketplaces.

Analyzing data from orders from August 2017 – August 2018, I uncovered important insights to enhance Olist business.

[View full presentation (PDF)](olist-marketplace-presentation.pdf)

[View SQL queries](projects/olist-marketplace/sql/)

## Sales, growth and retention gap

The marketplace operates at an average of approximately 6,000 orders and 826,000 in monthly revenue, supported by around 6,000 new customers per period. 

<img src="https://github.com/Philipy-Ferreira/data-analysis/blob/afba3cfdd5f04c1df27b457ab7af3a847d474d0f/Files/orders.png" width="800"/>

However, only about 31 customers are retained on average, resulting in a repeat purchase rate close to 0.5% .

<img src="https://github.com/Philipy-Ferreira/data-analysis/blob/afba3cfdd5f04c1df27b457ab7af3a847d474d0f/Files/customers.png" width="800"/>

This dynamic reveals that growth is not driven by retention but by continuous customer acquisition, with peaks such as November driven entirely by inflow rather than repeat demand.

> [!IMPORTANT]
> The marketplace operates without demand accumulation, making growth structurally dependent on acquisition. This increases CAC pressure and limits long-term scalability.

> [!TIP]
> Improving retention is the highest-impact lever: even marginal gains would compound growth, reduce acquisition dependency, and increase customer lifetime value. **Loyalty programs, improved user experience and post-purchase engagement** are therefore central to unlocking this potential.


## Operational driver

Operational performance shows high reliability on average, with 93.12% of orders delivered on time and 6.88% delayed. However, delays spike during peak periods, reaching up to 18%.

<img src="https://github.com/Philipy-Ferreira/data-analysis/blob/afba3cfdd5f04c1df27b457ab7af3a847d474d0f/Files/operations.png" width="800"/>


Regression analysis identifies delivery time as the strongest predictor of customer satisfaction, with each additional day reducing review score by 0.05 points. Customer satisfaction is directly and quantitatively linked to delivery performance.

> [!IMPORTANT]
> Operational inefficiencies translate into lower satisfaction and indirectly constrain retention, reinforcing the acquisition dependency observed.

> [!TIP]
> Logistics is a strategic lever. Improving delivery speed and reliability directly enhances customer experience and supports long-term growth through higher retention.

## Market concentration

The marketplace shows a dual structure: highly fragmented at the seller level (HHI = 39), but extremely concentrated geographically (HHI = 4,348), well above the threshold for high concentration.

> [!NOTE]
> Herfindahl-Hirschman Index (HHI): a standard economics measure of market concentration. Above 2,500 = highly concentrated.

This is reflected in the distribution of activity, where São Paulo alone accounts for 64% of total sales, while no other state exceeds even 10%.

<img src="https://github.com/Philipy-Ferreira/data-analysis/blob/afba3cfdd5f04c1df27b457ab7af3a847d474d0f/Files/marketshare.png" width="800"/>

Competition exists at the seller level, but is geographically localized. The marketplace is structurally diversified in participation, yet concentrated in execution.

> [!IMPORTANT]
> This creates a single-point dependency: overall performance is tied to one regional market, increasing exposure to localized shocks and limiting scalable national growth.

> [!TIP]
> Geographic diversification is a priority. Expanding seller presence and demand capture across multiple states reduces risk and improves growth resilience.

## Expansion prioritization

To identify expansion opportunities, market share was compared to GDP share across states. This reveals a mismatch between economic size and marketplace penetration .

States such as Minas Gerais, Rio de Janeiro, and Rio Grande do Sul have significant GDP weight but relatively low marketplace participation.

<img src="https://github.com/Philipy-Ferreira/data-analysis/blob/afba3cfdd5f04c1df27b457ab7af3a847d474d0f/Files/representation.png" width="800"/>

The constraint is not demand, but penetration. The marketplace underperforms in economically large regions.

> [!IMPORTANT]
> Growth is currently suboptimal: the platform expands in already saturated regions while leaving high-potential markets underexplored.

> [!TIP]
> Prioritize expansion in MG, RJ, and RS. Focus on increasing seller density, logistics coverage, and regional acquisition strategies to capture existing demand.





