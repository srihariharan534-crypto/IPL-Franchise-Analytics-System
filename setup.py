"""
IPL Franchise Analytics System — Package Setup
=================================================
Enterprise-grade IPL franchise decision intelligence platform.
"""

from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

with open("requirements.txt", "r", encoding="utf-8") as fh:
    requirements = [line.strip() for line in fh if line.strip() and not line.startswith("#")]

setup(
    name="ipl-franchise-analytics",
    version="1.0.0",
    author="IPL Analytics Team",
    author_email="analytics@yourfranchise.com",
    description="Enterprise-grade IPL Franchise Analytics, BI, Forecasting & Decision Support Platform",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/yourfranchise/IPL-Franchise-Analytics-System",
    packages=find_packages(exclude=["tests*", "notebooks*"]),
    classifiers=[
        "Programming Language :: Python :: 3.11",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Intended Audience :: Developers",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
    ],
    python_requires=">=3.11",
    install_requires=requirements,
    entry_points={
        "console_scripts": [
            "ipl-etl=etl.orchestration.master_pipeline:main",
            "ipl-api=api.app:main",
            "ipl-dashboard=streamlit_app.main:main",
        ],
    },
    include_package_data=True,
    package_data={
        "": ["*.yaml", "*.yml", "*.sql", "*.md"],
    },
)
