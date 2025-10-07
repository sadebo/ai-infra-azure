from prefect import flow, task

@task
def say_hello(name: str):
    print(f"Hello {name}!")

@flow
def demo_flow():
    say_hello("AI Infra Engineer")

if __name__ == "__main__":
    demo_flow()
