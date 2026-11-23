import LiveScripts.Shared
import LiveScripts.S_7a35cf17f7d4fc14e9b5ba99cf9be338d0e05a9df3841de767728ae5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7a35cf17f7d4fc14e9b5ba99cf9be338d0e05a9df3841de767728ae5.script [redeemer, ctx] 10000]
