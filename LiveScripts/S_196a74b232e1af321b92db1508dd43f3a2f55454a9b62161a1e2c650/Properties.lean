import LiveScripts.Shared
import LiveScripts.S_196a74b232e1af321b92db1508dd43f3a2f55454a9b62161a1e2c650.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_196a74b232e1af321b92db1508dd43f3a2f55454a9b62161a1e2c650.script [ctx] 10000]
