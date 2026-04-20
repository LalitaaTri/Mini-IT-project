import asyncpg
import asyncio

class Database:
    _pool = None

    @classmethod
    async def get_pool(cls):
        if cls._pool is None:
            cls._pool = await asyncpg.create_pool(
                dsn="postgresql://teamup_mmu:4^y!-m@127.0.0.1:5432/teamup_mmu"
            )
        return cls._pool